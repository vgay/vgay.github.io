
\version "2.22.0"
#(set-global-staff-size 17)
\include "AdditionalFunctions.ly"
\include "VariablesJazz.ly"
\include "jazzchords.ily"
\include "lilyjazz.ily"



\paper {
  indent = 0\mm
  ragged-last-bottom = ##t
  ragged-bottom = ##f
  ragged-last = ##f
  markup-system-spacing = #'((basic-distance . 23)
                             (minimum-distance . 8)
                             (padding . 1))
  score-system-spacing = #'((basic-distance . 23)
                            (minimum-distance . 20)
                            (padding . 5))
}

title = #"Cap'tain Ferber"
composer = #"Franck Wolf"
meter = #"(Med. Funk)"
kwtempo = #"Medium"
kwstyle = #"Funk"

realBookTitle = \markup {
  \score {
    {
      \override TextScript.extra-offset = #'(0 . -4.5)
      s4
      s^\markup {
        \fill-line {
          \fontsize #1 \lower #1 \rotate #7 \concat { " " #meter }
          \fontsize #4
          \override #'(offset . 9)
          \override #'(thickness . 6)
          \underline \larger \larger #title
          \fontsize #1 \lower #1 \concat { #composer " " }
        }
      }
      s
    }
    \layout {
      \omit Staff.Clef
      \omit Staff.TimeSignature
      \omit Staff.KeySignature
      ragged-right = ##f
    }
  }
}

\header {
  pdftitle = #title
  pdfauthor = #composer
  pdfcomposer = #composer
  pdfkeywords = \markup \concat { #kwtempo " " #kwstyle }
  title = \realBookTitle
  asplayed = #"Biréli Lagrène" % doit être commentée si vide
  url = #"https://www.youtube.com/watch?v=56BSTeqyaSo"
  arranger = \markup \on-the-fly #played?
  \with-url #url
  \with-color #blue \underline
  \concat { "(as played by " \fromproperty #'header:asplayed ")" }
  tagline = ##f
}

\layout {
  \context {
    \Score
    %voltaSpannerDuration = #(ly:make-moment 4 4)
    \override Glissando #'style = #'zigzag
    \override Glissando.breakable = ##t
    \override Glissando.after-line-breaking = ##t
    startRepeatType = #"[|:"
    endRepeatType = #":|]"
    doubleRepeatType = #":|][|:"
    \override Clef #'break-visibility = #'#(#f #f #f)
    \override KeySignature #'break-visibility = #'#(#f #f #f)
    \override SystemStartBar #'collapse-height = #1
    \override ParenthesesItem.font-size = #2
      \override NonMusicalPaperColumn #'line-break-permission = ##f
      \override NonMusicalPaperColumn #'page-break-permission = ##f
  }
  \context { 
    \Staff
    printPartCombineTexts = ##f
    \consists "Merge_rests_engraver"
  }
  \context {
    \ChordNames
    \override ParenthesesItem.font-size = #2
  }
  %   \context { \RemoveEmptyStaffContext 				% ne pas imprimer les lignes vides (autres que la première)
  %              \override VerticalAxisGroup #'remove-first = ##t			% Concerne la première ligne
  %   }
}



form = \markup  \fill-line {
  \column {  }
  \column { \line { \with-color #red \fontsize #2 "Solos on AABBA then D.S. al Fine" } }
}

harmonies = \chordmode {
  \set chordChanges = ##t
  s8 c1*4:7 f:7 c:7 g:7
  c4:7 s16 des4:7 s16 d4:7 s16 es4:7 s4 s16 c2:7
  c1*4:7 f:7 c:7 g:7 g1:7
  c4:7 s16 des4:7 s16 d4:7 s16 es4:7 s4 s16 c2:7 g1:7
  c4:7 s16 des4:7 s16 d4:7 s16 es4:7 s16 c4:7 s16 des4:7 s16 d4:7 s16 es4:7 s16
  c4:7 s16 des4:7 s16 d4:7 s16 es4:7 s16 s4 c:7
}

voltaAdLib = \markup { \text \fontsize #3 { ad lib. } }
voltaEndSolo = \markup { \text \fontsize #3 { End Solo on Cue } }
voltaLastSolo = \markup { \text \fontsize #3 { After Last Solo } }

theNotes =  \relative c'' {
  \key f \major \time 4/4
    \override Rest #'staff-position = #0
%  \Intro \comp #15 r8 g16 bes | \break 
\partial 8 g16 bes \bar "||"
  \AetS c bes g c r g bes c es e c g bes a g8~ |
  2 r4. g16 bes | 
  c bes g c r g bes c es e f fis g fis f es |
  e! g bes d a8 g16 c r bes as e c bes as e | \break
  es4 f16 g as a b8 d16 b c des d f |
  es c8. r8 e16 des r8 r16 des as' g8 f16~ |
  \tuplet 3/2 { f8 es4 } c es16 f g es d c b c |
  f e es8 g16 fis f8 a16 as g8 f16 e es d | \break
  \B  c bes g c r g bes c es e c g bes a g8~ |
  2 r4. g16 bes | 
  c bes g c r g bes c es e f fis g fis f es |
  e g bes d a8 g16 c r4 r16 c8. | \break
  f,8 g16 f r g,8 b16 d des c bes b d g8~ |
  2 r4 r16 d8 f16 |
  g f d g r d f g bes b c des d des c bes |
  b! g f e d8 c16 b r4. g16 bes | \break
  \doubleMark 
  \markup { \with-color #red \musicglyph "scripts.varcoda" }
  \markup \bold \box C
  c bes g c r[ des b as] des[ r d c] a[ d r es16] |
  des bes es8-. r4 <c c'> r \break
  \repeat volta 3 { 
    \Solos \comp #32 \break
    \comp #28 }
  \alternative {
    {   \set Score.repeatCommands = #(list (list 'volta voltaAdLib) )
      \comp #4 \break \bar ":|]"
    }
    { \set Score.repeatCommands = #(list (list 'volta voltaEndSolo))
      \comp #3 r8 g16 bes \bar "||"
      c bes g c r[ des b as] des[ r d c] a[ d r es16] |
      des bes es8-. r4 <c c'> r  \bar ":|]"
    }
    { 
      \set Score.repeatCommands = #(list (list 'volta voltaLastSolo) )
      \comp 3 r8 g16 bes  \DCalCoda \break
    	\bar #"||"}
  }
  c bes g c r[ des b as] des[ r d c] a[ d r es16] |
  des bes es8-. c16 bes g c r[ des b as] des[ r d c] | \break
  a[ d r es] des bes es8-. c16 bes g c r[ des b as] |
  des[ r d c] a[ d r es] des bes es8-. r4 | <c c'> r r2 \bar ".."
}

chordsRhythm = \relative c''' {
  \override Rest #'staff-position = #7
  \improvisationOn \override NoteHead.no-ledgers = ##t 
}

Basse = \relative c {
  \override Rest #'staff-position = #0
  \clef "bass" \key f \major \time 4/4
}

grille = \chordmode {
  \bar "[|:"
 
  \bar ".." }

marques = \relative c' { 
}


\book {
  \paper {
    #(set-paper-size "tablette")
    page-count = #2
  }
  #(define output-suffix "CTab")
  \header { meter = \markup \with-color #red \bold "partition sur 2 pages" }
  \bookpart {
    \score {
      <<
        \new ChordNames { \harmonies }
        \new Staff \with { instrumentName = \CleSol } <<
          %\new Voice \with { \consists "Pitch_squash_engraver" } 
          << { \theNotes } \\ { s8 s1*18 \pageBreak } >>
        >> 
      >>
    } %\form
} }

\book {
  \paper {
    #(set-paper-size "tablette")
    page-count = #2
  }
  #(define output-suffix "BbTab") 
  \header { meter = \markup \with-color #red \bold "partition sur 2 pages" }
  \bookpart {
    \score {
      <<
        \new ChordNames { \transpose c d \harmonies } 
        \new Staff \with { instrumentName = \Bb } <<
          %\new Voice \with { \consists "Pitch_squash_engraver" }  
          << { \transpose c d \theNotes } \\ { s8 s1*18 \pageBreak } >>
        >> 
      >>
    } %\form
} }

\book {
  \paper {
    #(set-paper-size "tablette")
    page-count = #2
  }
  #(define output-suffix "EbTab")
  \header { meter = \markup \with-color #red \bold "partition sur 2 pages" }
  \bookpart {
    \score {
      <<
        \new ChordNames { \transpose c a \harmonies }
        \new Staff \with { instrumentName = \Eb } <<
          %\new Voice \with { \consists "Pitch_squash_engraver" }  
         << { \transpose c a, \theNotes } \\ { s8 s1*18 \pageBreak } >>
        >> 
      >>
    } %\form
} }

\book {
  \paper {
    #(set-paper-size "a4")
    page-count = #1
  }
  #(define output-suffix "Ca4")
  \bookpart {
    \score {
      <<
        \new ChordNames { \harmonies }
        \new Staff \with { instrumentName = \CleSol } 
        <<
          %\new Voice \with { \consists "Pitch_squash_engraver" } 
          \theNotes
        >> 
      >>
} } }

\book {
  \paper {
    #(set-paper-size "a4")
    page-count = #1
  }
  #(define output-suffix "Bba4") 
  \bookpart {
    \score {
      <<
        \new ChordNames { \transpose c d \harmonies } 
        \new Staff \with { instrumentName = \Bb  } <<
          % \new Voice \with { \consists "Pitch_squash_engraver" }  
          \transpose c d \theNotes
        >> 
      >>
} } }

\book {
  \paper {
    #(set-paper-size "a4")
    page-count = #1
  }
  #(define output-suffix "Eba4")
  \bookpart {
    \score {
      <<
        \new ChordNames { \transpose c a \harmonies }
        \new Staff \with { instrumentName = \Eb } <<
          %\new Voice  
          \transpose c a, \theNotes
        >> 
      >>
} } }

\book {
  \paper {
    #(set-paper-size "a4")
    page-count = #1
  }
  #(define output-suffix "Bass")
  \bookpart {
    \score {
      <<
        \new ChordNames { \harmonies }
        \new Staff \with { instrumentName = \CleFa } 
        <<
          %\new Voice \with { \consists "Pitch_squash_engraver" } 
          \clef "bass" \transpose c c,,\theNotes
        >> 
      >>
} } }

%{
convert-ly (GNU LilyPond) 2.22.0  convert-ly: Traitement de «  »...
Conversion en cours : 2.21.0, 2.21.2, 2.22.0
%}
