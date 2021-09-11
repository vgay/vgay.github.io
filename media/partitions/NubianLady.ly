
\version "2.20.0"
#(set-global-staff-size 18)
\include "AdditionalFunctions.ly"
\include "VariablesJazz.ly"
\include "jazzchords.ily"
\include "lilyjazz.ily"



\paper {
  indent = 0\mm
  ragged-last-bottom = ##t
  ragged-bottom = ##f
  ragged-last = ##f
  markup-system-spacing = #'((basic-distance . 18)
                             (minimum-distance . 8)
                             (padding . 1))
  score-system-spacing = #'((basic-distance . 23)
                            (minimum-distance . 20)
                            (padding . 2))
}

title = #"Nubian Lady"
composer = #"Yusef Lateef"
meter = #"(Funky)"
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
  pdfkeywords = \markup \concat { #kwtempo " " #kwstyle }
  title = \realBookTitle
  asplayed = #"Yusef Lateef" % doit être commentée si vide
  url = #"https://www.youtube.com/watch?v=qJfiL7Ru8Qw"
  arranger = \markup \on-the-fly #played?
  \with-url #url
  \with-color #blue \underline
  \concat { "(as played by " \fromproperty #'header:asplayed ")" }
  poet = \markup {\tiny \note #"4" #1 \raise #-0.4 "= 140 half time feel"}
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
    explicitKeySignatureVisibility = #end-of-line-invisible
    explicitClefVisibility = #end-of-line-invisible
    \override TimeSignature.break-visibility = ##(#f #t #t)
    
  }
  \context {
    \ChordNames
    \override ParenthesesItem.font-size = #2
  }
  %   \context { \RemoveEmptyStaffContext 				% ne pas imprimer les lignes vides (autres que la première)
  %              \override VerticalAxisGroup #'remove-first = ##t			% Concerne la première ligne
  %   }
}


harmonies = \chordmode {
  \set chordChanges = ##t
e1*4:7 e1*8:7 e1*8:7 e1*2:7sus4 d1*2:7sus4 c1*2:6 e1*2:7
}


theNotes =  \relative c''' {
  \clef "treble" \key a \major \time 4/4
  \showStartRepeatBar \bar "[|:" 
  \override Rest #'staff-position = #0
  \override MultiMeasureRest #'staff-position = #0
  \override TextSpanner.bound-details.left.text = "piano fill"
  \textSpannerDown
  \A
  \repeat volta 2
  {
    gis?1~ | 1~ | 2 r2 | < b, gis'>8 _\markup "(piano)" <ais g'>4 <a e'>8~ q < gis d'>~ q4~
    d'1~ \startTextSpan | 1 | R1 | R \stopTextSpan \bar "||" \break
    gis1~ | 1~ | 2 r2 | < b, gis'>8 _\markup "(piano)" <ais g'>4 <a e'>8~ q < gis d'>~ q4~
    d'1~ \startTextSpan | 1 | R1 | R \stopTextSpan \bar "||" \break \B
    r2 r4 e,4 | g4 a b-. d,8 e~ | 2 r4 e | g4 a b-. d,8 e~ | \break
    2 r4 e | g4 \tuplet 3/2 { a4 e8 } \tuplet 3/2 { b' a g } \tuplet 3/2 { d4 e8~ } | 
    1~ _\markup { "Bass plays " \box A pattern } | 1
    \once \override Score.RehearsalMark #'direction = #DOWN
    \once \override Score.RehearsalMark #'self-alignment-X = #RIGHT
    \once \override Score.RehearsalMark.extra-offset = #'(0 . -2)
    
    
  }
}

chordsRhythm = \relative c''' {
  \override Rest #'staff-position = #7
  \improvisationOn \override NoteHead.no-ledgers = ##t 
  s1*16 \repeat unfold 4 { c4. 8~ 2~ | 1 }
}

Basse = \relative c, {
  \override Rest #'staff-position = #0
  \clef "bass" \key a \major \time 4/4
  \showStartRepeatBar \bar "[|:" \Intro
  \repeat volta 2
  { e1 _\markup "Bass Line" | b'8 d4 8~ 8 b8 e4 | e,1 | 
    b'8 d4 _\markup { "Bass continue simile over " \box A } 8~ 8 b8 e4 | } \break}

grille = \chordmode {
  }

marques = \relative c' { 

}


\book {
  \paper {
    #(set-paper-size "tablette")
    page-count = #1
  }
  #(define output-suffix "CTab")
  %\header { meter = \markup \with-color #red \bold "partition sur 2 pages" }
  \bookpart {
    \score {
      <<
        \new ChordNames { \harmonies }
        \new Staff \with { instrumentName = \CleSol } <<
          %\new Voice \with { \consists "Pitch_squash_engraver" } 
          { \Basse << \chordsRhythm \\ \theNotes >> }
        >> 
      >>
    } \markup  \fill-line {
  \column {  }
  \column { \line { \fontsize #2 "Solos over E" \raise #1 { \smaller "7" } } } }
} }

\book {
  \paper {
    #(set-paper-size "tablette")
    page-count = #1
  }
  #(define output-suffix "BbTab") 
  %\header { meter = \markup \with-color #red \bold "partition sur 2 pages" }
  \bookpart {
    \score {
      <<
        \new ChordNames { \transpose c d \harmonies } 
        \new Staff \with { instrumentName = \Bb } <<
          %\new Voice \with { \consists "Pitch_squash_engraver" }  
          { \Basse << \chordsRhythm \\ \transpose c d \theNotes >> }
        >> 
      >>
    } \markup  \fill-line {
  \column {  }
  \column { \line { \fontsize #2 "Solos over F" \raise #1 { \sharp \smaller "7" } } }
}
} }

\book {
  \paper {
    #(set-paper-size "tablette")
    page-count = #1
  }
  #(define output-suffix "EbTab")
  %\header { meter = \markup \with-color #red \bold "partition sur 2 pages" }
  \bookpart {
    \score {
      <<
        \new ChordNames { \transpose c a \harmonies }
        \new Staff \with { instrumentName = \Eb } <<
          %\new Voice \with { \consists "Pitch_squash_engraver" }  
          { \Basse << \chordsRhythm \\ \transpose c a, \theNotes >> }
        >> 
      >>
    } \markup  \fill-line {
  \column {  }
  \column { \line { \fontsize #2 "Solos over C" \raise #1 { \sharp \smaller "7" } } }
}
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
          { \Basse << \chordsRhythm \\ \theNotes >> }
        >> 
      >>
    } \markup  \fill-line {
  \column {  }
  \column { \line { \fontsize #2 "Solos over E" \raise #1 { \smaller "7" } } }
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
         { \Basse << \chordsRhythm \\ \transpose c d \theNotes >> }
        >> 
      >>
    } \markup  \fill-line {
  \column {  }
  \column { \line { \fontsize #2 "Solos over F" \raise #1 { \sharp \smaller "7" } } }
}
} } 

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
          { \Basse << \chordsRhythm \\ \transpose c a, \theNotes >> }
        >> 
      >>
    } \markup  \fill-line {
  \column {  }
  \column { \line { \fontsize #2 "Solos over C" \raise #1 { \sharp \smaller "7" } } }

} } }