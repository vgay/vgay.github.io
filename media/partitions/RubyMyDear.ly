
\version "2.19.80"
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

title = #"Ruby, My Dear"
composer = #"Thelonious Monk"
meter = #"(Straight Ballad)"
kwtempo = #"Mod. Slow"
kwstyle = #"Ballad"

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
  pdfkeywords = \markup \concat { #kwtempo " " #kwstyle }
  title = \realBookTitle
  asplayed = #"Thelonious Monk & John Coltrane" % doit être commentée si vide
  url = #"https://www.youtube.com/watch?v=6liAgg4SN88"
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
  es2:7+9+11+ e:9.11 fis4:6.9 b:9- bes2:9-
f2:m7 bes:9- es4.:7+ f8:m7 fis:m7 g:m7 as:6 ges/bes g2:m7 c:9- f4:7+ g:m7 as:m7 a:m7
  bes2:m7 es:9- as4:7+ \tuplet 3/2 { s8 bes:m7 b:m7 } c2:m7 bes2:m7.11 a:1.3.5.9 e:7sus4 bes:5-7 b:m7.11 bes:5-7
  a1:7+ b2:m e:9- a1:6.9 bes2:6 b:dim7 c4:m c:m7+ c1:m7  d2:m7 es1:m7 as2:5-13 es
  f2:m7 bes:9- es4.:7+ f8:m7 fis:m7 g:m7 as:6 ges/bes g2:m7 c:9- f4:7+ g:m7 as:m7 a:m7
  bes2:m7 es:9- as4:7+ bes:m7 b:m7 c:m7 bes2:m7 e:9.11 fis4:6.9 b:9- bes2:9-
  fis4.:6.9  b8:9- bes2:9-   a2:5-7 as:5-13 des1:7+9
}


theNotes =  \relative c''' {
  \clef "treble" \time 4/4
  \Intro R1*2 \break
\repeat volta 2 {
  \A r4 g~ \tuplet 3/2 { g f b, } | bes1 | r4 a'~ a8 g des4 | c2. r4 | \break
  c'2 bes4. e,8 | es2 r8 f c des | es2~ es8 fis cis d }
\alternative { { e?2 r4 fis } { e?2.. r8 } } \bar "||" \break
\B e2 fis4. cis8 | b2 f4 cis' | fis,4 fis2 gis4 | g?4 g2. | \break
c2. d8 c | g2 r4 a | es'8 es4. f4 es | bes8 f'~ f2 fis4 \bar "||" \break
\A r4 g~ \tuplet 3/2 { g f b, } | bes1 | r4 a'~ a8 g des4 | c2. r4 | \break
c'2 bes4. e,8 | es2 r8 f c des |  es2~ es8 fis \tuplet 3/2 { e cis a }
\toCoda as2. r4 \bar "|." \break \Coda
as2 r8 e' \tuplet 3/2 { d b? as } | 
g2 \tuplet 3/2 { r8 ges c  } \tuplet 3/2 { d f c } | es1 \fermata

\bar ".."
}

rightHand = \relative c'' {
  \clef "treble" \time 4/4
  << { r2 r8 fis \tuplet 3/2 { e cis a } | gis1 } \\
     { r4. <d fis a>8 <a d fis a>2 | dis4. c8 ces2 } >>
}

leftHand = \relative c {
  \clef "bass" \time 4/4
  r4. <es bes g'>8 <e b gis'>2 | <fis cis ais'>4. <b, a'>8 
  << { as'2 } \\ { bes,4 bes, } >> 
  \once \override Score.Clef  #'break-visibility = #'#(#f #f #t)
  \comp #4 \improvisationOn d'4. \improvisationOff
  <f, c' es as>8 <fis cis' e a> <g d' f bes> <as es' f c'> <bes g' bes d> |
  <g f' g bes d>2 \comp #2 |
  <f c' e a>4 <g d' f bes> <as es' ges ces> <a e' g c> |
  <bes f' as des>2 \comp #2 |
  <as g' c>4~ \tuplet 3/2 { q8 <bes as' des> <b a' d> } <c bes' es>2 |
  \comp #20 a8 e' a, e' a, e' a, e' \comp #18
  es,16 bes' g'_( bes~ <g bes>4)
  \comp #4 \improvisationOn d4. \improvisationOff
  <f, c' es as>8 <fis cis' e a> <g d' f bes> <as es' f c'> <bes g' bes d> |
  <g f' g bes d>2 \comp #2 |
  <f c' e a>4 <g d' f bes> <as es' ges ces> <a e' g c> |
  <bes f' as des>2 \comp #2 |
  <as g' c>4~ \tuplet 3/2 { q8 <bes as' des> <b a' d> } <c bes' es>2 |
  \comp #5 <b a' c>4 <bes as' ces>2
  \improvisationOn d4. \improvisationOff <b a' c>8 <bes as' ces>2 |
  \comp #4 \improvisationOn d1 \fermata \improvisationOff
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
          \theNotes
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
          \transpose c d \theNotes
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
          \transpose c a \theNotes
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
        \new Staff \with { instrumentName = \CleSol } \theNotes
        \new ChordNames { \harmonies }
        \new Staff \rightHand
        \new Staff \leftHand
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
    } %\form
    %}  \bookpart {
    \score {
      \layout {
        indent = 0
        ragged-right = ##f
        ragged-last = ##f
        \context {
          \Score
          \remove "Volta_engraver"
          \omit Clef % Cacher la clef
          \omit TimeSignature % cacher la métrique
          \omit BarNumber             
          \override SpacingSpanner.strict-note-spacing = ##t
          proportionalNotationDuration = #(ly:make-moment 1/16)
        }
      }
      <<
        \new Staff \with {
          \remove "Staff_symbol_engraver"
        }    
        \marques
        \new ChordNames \with {
          \override ChordName.extra-offset = #'(10 . -1 )         
          \override ParenthesesItem.extra-offset = #'(10 . -1 ) 
          \override BarLine.bar-extent = #'(-5 . 5)
          \consists "Bar_engraver"
          \override StaffSymbol.line-positions = #'( -10 10 ) 
          \consists "Staff_symbol_engraver"
          \consists "Percent_repeat_engraver"
          \consists "Volta_engraver"
        }
        \transpose c d \grille
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
          \transpose c a \theNotes
        >> 
      >>
    } %\form
    %}  \bookpart {
    \score {
      \layout {
        indent = 0
        ragged-right = ##f
        ragged-last = ##f
        \context {
          \Score
          \remove "Volta_engraver"
          \omit Clef % Cacher la clef
          \omit TimeSignature % cacher la métrique
          \omit BarNumber             
          \override SpacingSpanner.strict-note-spacing = ##t
          proportionalNotationDuration = #(ly:make-moment 1/16)
        }
      }
      <<
        \new Staff \with {
          \remove "Staff_symbol_engraver"
        }    
        \marques
        \new ChordNames \with {
          \override ChordName.extra-offset = #'(10 . -1 )         
          \override ParenthesesItem.extra-offset = #'(10 . -1 ) 
          \override BarLine.bar-extent = #'(-5 . 5)
          \consists "Bar_engraver"
          \override StaffSymbol.line-positions = #'( -10 10 ) 
          \consists "Staff_symbol_engraver"
          \consists "Percent_repeat_engraver"
          \consists "Volta_engraver"
        }
        \transpose c a \grille
      >>
} } }