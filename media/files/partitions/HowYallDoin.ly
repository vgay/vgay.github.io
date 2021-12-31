\version "2.22.1"
#(set-global-staff-size 17)
\include "double-mark.ly"
\include "AdditionalFunctions.ly"
\include "VariablesJazz.ly"
\include "jazzchords.ily"
\include "lilyjazz.ily"



\paper {
  %indent = 0\mm
  ragged-last-bottom = ##f
  ragged-bottom = ##f
  ragged-last = ##f
  markup-system-spacing = #'((basic-distance . 23)
                             (minimum-distance . 15)
                             (padding . 2))
  score-system-spacing = #'((basic-distance . 23)
                            (minimum-distance . 20)
                            (padding . 5))
}

title = #"How Y'all Doin'"
composer = #"Graham Flowers"
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
  pdfkeywords = \markup \concat { #kwtempo " " #kwstyle }
  title = \realBookTitle
  asplayed = #"Kyle Eastwood" % doit être commentée si vide
  url = #"https://www.youtube.com/watch?v=yev6a2qwcic"
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
    \override MultiMeasureRest #'expand-limit = #3
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
  \context { \Score markFormatter = #format-mark-box-alphabet }
  %   \context { \RemoveEmptyStaffContext 				% ne pas imprimer les lignes vides (autres que la première)
  %              \override VerticalAxisGroup #'remove-first = ##t			% Concerne la première ligne
  %   }
}



global = {
  \key d \major
  \time 4/4
  \override MultiMeasureRest #'expand-limit = #3
}

structure = \markuplist {
  \wordwrap-lines {
    On the record : Sax solo on ABB (Trumpett plays the writen part), Intro again (Bass alone) then Sax open solo (without Trumpett) and fade out on A.
  }
}


ossature =  \relative c {
  \set Score.markFormatter = #format-mark-box-letters
  \time 4/4 
  \mark \markup { \box \bold { Intro } } 
  s1*4 \break \bar "||"
  \once \override Score.RehearsalMark #'self-alignment-X = #LEFT
  \mark \markup { \bold \box A \fontsize #-3 { " (The same two chords throughout" \box A and \box B ) }  }
  s1*4 \break s1*4 \break  \break s1*4 \break 
  \once \override Score.RehearsalMark #'self-alignment-X = #LEFT
  \mark \markup { \bold \box "B" \fontsize #-1 " (played twice during solo)" }
  s1*4 \break s1*4 \break
  \once \override Score.RehearsalMark #'self-alignment-X = #LEFT
  \mark \markup { \box \bold { "Bass Solo" } } 
  s1*4 }

ossatureTab =  \relative c {
  \set Score.markFormatter = #format-mark-box-letters
  \time 4/4 
  \mark \markup { \box \bold { Intro } } 
  s1*4 \break
  \once \override Score.RehearsalMark #'self-alignment-X = #LEFT
  \mark \markup { \bold \box A \fontsize #-3 { " (The same two chords throughout" \box A and \box B ) }  }
  \bar "||"
  s1*4  \break s1*4 \pageBreak s1*4 \break
  \mark #2 s1*4 \break s1*4 \break 
  \once \override Score.RehearsalMark #'self-alignment-X = #LEFT
  \mark \markup { \box \bold { "Chorus Basse" } } 
   s1*4 
}


Accords =  \chordmode {
  s1*4 
  e1:m7 a:7sus4 e1:m7 a:13 s1*16
  b1*4:m 
}


Trumpett = \relative c' {
  \global
  R1*4 | % 5
  \repeat unfold 3 {
    d16  dis  e r r4  b'8 r4 a8 | fis2 r | % 7
    d16  dis  e8 r4  b'8 r4 a8 | fis1 }
  \repeat unfold 4 {
    cis'8  e  g  cis,16 e ~  e8  r4. | % 18
    r16  a,  a  a  a8.  g16 a  g  a  g ~  g8 e }
  R1*4

}


Tenor = \relative c' {
  \global
  \clef "treble_8"
  R1*8 | % 9
  r4  e  d8  d  cis16 b  a8 | 
  b2 r16  e,  g  d' cis8  e | % 11
  R1 | % 12
  r2  fis16  g  a fis ~ fis8  d | % 13
  e4. r8  d2 | % 14
  cis16  b  a8 ~  a4 r2 | % 15
  r8   d,16  es  e  d cis  d  e4 r | % 16
  r16  e  a  d  b8 d16  b  cis d  e a ~  a8  g | % 17
  e,8  g  b  e,16  g ~  g8 r4. 
  %e,8  g  b  e,16  g ~  g8 r4. | % 18
  r16 g16  g  g  g8. e16  g  e  g  e ~  e8  cis | % 19
  e8  g  b  e,16  g ~  g8 a r4 
  %e,8  g  b  e,16  g ~  g8 r4. | % 18
  r16  g  g  g  g a  b  d  e  b8 a16  g4 | % 21
  e8  g  b  e,16  g ~  g8 r4. 
  %e,8  g  b  e,16  g ~  g8 r4. | % 18
  r16  g  g  g  g8 b16  d  e8  e,16  g ~  g4 | % 23
  e8  g  b  e,16  g ~  g8 a r4
  %e,8  g  b  e,16  g ~  g8 r4. | % 18
  <cis e>2  a16  g  a  g ~  g8  e  
}

TenorEb = \relative c' {
  \global
  \clef "treble_8"
  R1*8 | % 9
  r4  e  d8  d  cis16 b  a8 | 
  b2 r16  e,  g  d' cis8  e | % 11
  R1 | % 12
  r2  fis16  g  a fis ~ fis8  d | % 13
  e4. r8  d2 | % 14
  cis16  b  a8 ~  a4 r2 | % 15
  r8   d16  es  e  d cis  d  e4 r | % 16
  r16  e,  a  d  b8 d16  b  cis d  e a ~  a8  g | % 17
  e8  g  b  e,16  g ~  g8 r4. 
  %e,8  g  b  e,16  g ~  g8 r4. | % 18
  r16 g16  g  g  g8. e16  g  e  g  e ~  e8  cis | % 19
  e8  g  b  e,16  g ~  g8 a r4 
  %e,8  g  b  e,16  g ~  g8 r4. | % 18
  r16  g  g  g  g a  b  d  e  b8 a16  g4 | % 21
  e8  g  b  e,16  g ~  g8 r4. 
  %e,8  g  b  e,16  g ~  g8 r4. | % 18
  r16  g  g  g  g8 b16  d  e8  e,16  g ~  g4 | % 23
  e8  g  b  e,16  g ~  g8 a r4
  %e,8  g  b  e,16  g ~  g8 r4. | % 18
  <cis e>2  a16  g  a  g ~  g8  e  
}




Guitare = \relative c' {
  \global
  \clef "treble_8" 
  R1*4 | \improvisationOn
  \repeat unfold 3 {
    r4 r8  b8 r4 b8 r8 | % 6
    r2  b8 r4  b8 | % 7
    r4 r8  b8 r4 b8 r8 | % 8
    R1 | }
  \repeat unfold 4 {
    b2 r8  8  4 | 1 }
  \improvisationOff
  \repeat unfold 2 {
    r4  <b d>8 \times 2/3 { r8  <b d>16 ~ } <b d>2 | % 26
    r4  <b d>8 \times 2/3 { r8  <b d>16 ~ } <b d>8  <fis b> ~  <fis b>4 }
}

Basse = \relative c, {
  \global
  % En avant la musique !
  e4  b'16  d  dis e ~  e  d  b8  a  g | % 2
  a4  d16  cis  fis, g ~  g  d'  g,8 d'16  g,8. | % 3
  e4  b'16  d  dis e ~  e  d  b8  a  g |
  a16  g  e  a, ~ a  a'  b,  cis r2 | % 5
  \repeat unfold 3 {
    e4  b'16  d  dis e ~  e  d  b8  a  g | 
    a4  d16  cis  fis, g ~  g  d'  g,8 d'16  g,8. |
    e4  b'16  d  dis e ~  e  d  b8  a  g | 
    cis,16  e  fis  a ~ a  g  fis e cis  e  cis  a ~  a cis  b a }
  \repeat unfold 3 {
    e'4..  b'16  e16  b8 g16  a16  g8  a16 ~ | % 18
    a8.  a16 ~  a4  cis16 g8.  cis16  g8.}
  e4..  b'16  e16  b8  g16 a16  g8  a16 ~ | % 24
  a8.  a16 ~  a4  fis16 cis8.  e16  a,8. | % 25
  \break
  \comp #16
}


\book {
  \paper { page-count = #1 }
  \header {meter = \markup \pad-around #1 \circle \bold \fontsize #-3 \concat {" " \musicglyph #"clefs.G" " "} }
  \bookpart {
    #(define output-suffix "RSa4")
    \score {
      <<
        \new ChordNames {
          \set chordChanges = ##f
          \Accords
        }
        \new Staff 
        <<
          \set Staff.instrumentName = "Piano"
          \new Voice = "Mel" { \Guitare }
        >>
        \new Staff 
        <<
          \set Staff.instrumentName = "Basse"
          \new Voice = "Mel" { \clef "bass_8" \Basse }
          \new Voice = "Ctrl" { \ossature }
        >>
      >>
      
    } \structure } }




\book {
  \header {meter = \markup \pad-around #1 \circle \bold \fontsize #-3  \concat {" " \musicglyph #"clefs.G" " "} }
  \bookpart {
    #(define output-suffix "Ca4")
    \score {
      <<
        \new ChordNames {
          \set chordChanges = ##f
          \Accords
        }
        \new Staff 
        <<
          \set Staff.instrumentName = "Trumpett"
          \new Voice = "Mel" { \Trumpett }
          \new Voice = "Ctrl" { \ossature }
        >>
        \new Staff \with { instrumentName = "Tenor Sax" } 
        \Tenor
      >>
    } 
    \structure
} }

\book {
  \header { 
    meter = \markup \pad-around #1 \fontsize #2 \circle \bold \concat {" " B \flat " "} }
  \bookpart {
    #(define output-suffix "Bba4")
    \score {
      <<
        \new ChordNames {
          \set chordChanges = ##f
          \transpose c d \Accords
        }
        \new Staff 
        <<
          \set Staff.instrumentName = "Trumpett"
          \new Voice = "Mel" { \transpose c d \Trumpett }
          \new Voice = "Ctrl" { \ossature }
        >>
        \new Staff \with {  instrumentName = "Tenor Sax" } 
        \transpose c d \Tenor 
      >>
    } 
    \structure
} }
\book {
  \header { 
    meter = \markup \pad-around #1 \fontsize #2 \circle \bold \concat {" " E \flat " "} }
  \bookpart {
    #(define output-suffix "Eba4")
    \score {
      <<
        \new ChordNames {
          \set chordChanges = ##f
          \transpose c a \Accords
        }
        \new Staff 
        <<
          \set Staff.instrumentName = "Trumpett"
          \new Voice = "Mel" { \transpose c a \Trumpett }
          \new Voice = "Ctrl" { \ossature }
        >>
        \new Staff \with { instrumentName = "Tenor Sax" } 
        \transpose c a, \TenorEb 
      >>
    } 
    \structure
} }


\book {
  #(define output-suffix "RSTab")
  \paper {
    page-count = #2
    ragged-bottom = ##t
    #(set-paper-size "tablette")
  }
  \header {meter = \markup \pad-around #1 \circle \bold \fontsize #-4 \concat {" " \musicglyph #"clefs.G" " "} }
  \bookpart {
    \score {
      <<
        \new ChordNames {
          \set chordChanges = ##f
          \Accords
        }
        \new Staff 
        <<
          \set Staff.instrumentName = "Piano"
          \new Voice = "Mel" { \Guitare }
        >>
        \new Staff 
        <<
          \set Staff.instrumentName = "Basse"
          \new Voice = "Mel" { \clef "bass_8" \Basse }
          \new Voice = "Ctrl" { \ossatureTab }
        >>
      >>
      
    } \structure } }




\book {
  #(define output-suffix "CTab")
  \paper {
    page-count = #2
    ragged-bottom = ##t
    #(set-paper-size "tablette")
  }
  \header {meter = \markup \pad-around #1 \circle \bold \fontsize #-4 \concat {" " \musicglyph #"clefs.G" " "} }
  \bookpart {
    \score {
      <<
        \new ChordNames {
          \set chordChanges = ##f
          \Accords
        }
        \new Staff 
        <<
          \set Staff.instrumentName = "Trumpett"
          \new Voice = "Mel" { \Trumpett }
          \new Voice = "Ctrl" { \ossatureTab }
        >>
        \new Staff \with { instrumentName = "Tenor Sax" } \Tenor 
      >>
    } 
    \structure
  } 
}

\book {
  #(define output-suffix "BbTab")
  \paper {
    page-count = #2
    ragged-bottom = ##t
    #(set-paper-size "tablette")
  }
  \header { 
    meter = \markup \pad-around #1 \fontsize #2 \circle \bold \concat {" " B \flat " "} 
  }
  \bookpart {
    \score {
      <<
        \new ChordNames {
          \set chordChanges = ##f
          \transpose c d \Accords
        }
        \new Staff 
        <<
          \set Staff.instrumentName = "Trumpett"
          \new Voice = "Mel" { \transpose c d \Trumpett }
          \new Voice = "Ctrl" { \ossatureTab }
        >>
        \new Staff \with { instrumentName = "Tenor Sax" } \transpose c d \Tenor 
      >>
    } 
    \structure
  } 
}

\book {
  #(define output-suffix "EbTab")
  \paper {
    page-count = #2
    ragged-bottom = ##t
    #(set-paper-size "tablette")
  }
  \header { 
    meter = \markup \pad-around #1 \fontsize #2 \circle \bold \concat {" " E \flat " "} 
  }
  \bookpart {
    \score {
      <<
        \new ChordNames {
          \set chordChanges = ##f
          \transpose c a \Accords
        }
        \new Staff 
        <<
          \set Staff.instrumentName = "Trumpett"
          \new Voice = "Mel" { \transpose c a \Trumpett }
          \new Voice = "Ctrl" { \ossatureTab }
        >>
        \new Staff \with { instrumentName = "Tenor Sax" } \transpose c a, \TenorEb 
      >>
    } 
    \structure
  } 
}

