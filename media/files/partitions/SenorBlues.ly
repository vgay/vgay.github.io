\version "2.22.1"
#(set-global-staff-size 17)
\include "double-mark.ly"
\include "AdditionalFunctions.ly"
\include "VariablesJazz.ly"
\include "jazzchords.ily"
\include "lilyjazz.ily"
\include "chord-grid-JAS.ly"



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
  system-system-spacing = #'((basic-distance . 15)
                             (minimum-distance . 8)
                             (padding . 0))
  oddHeaderMarkup = \markup {
    \on-the-fly \print-page-number-check-first {
      \fill-line { \null \concat { \fromproperty #'page:page-number-string "/" \page-ref #'theLastPage "0" "?"} }
  } }
  evenHeaderMarkup = \markup {
    \on-the-fly \print-page-number-check-first {
      \fill-line { \concat { \fromproperty #'page:page-number-string "/" \page-ref #'theLastPage "0" "?"} \null }
    }
  }
}

title = #"Señor Blues"
composer = #"Horace Silver"
meter = #"(Med. Latin)"
kwtempo = #"Medium"
kwstyle = #"Blues 6/8"

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
  asplayed = #"Horace Silver" % doit être commentée si vide
  url = #"https://www.youtube.com/watch?v=t8jFGFwOm7k"
  arranger = \markup \on-the-fly #played?
  \with-url #url
  \with-color #blue \underline
  \concat { "(as played by " \fromproperty #'header:asplayed ")" }
  tagline = ##f
}

\layout {
  \context {
    \Score
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
    \override MultiMeasureRest #'expand-limit = #1
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
}



form = \markup  \fill-line {
  \column {  }
  \column { \line { \with-color #red \fontsize #2 "Solos on AABBA then D.S. al Fine" } }
}

harmonies = \chordmode {
  \set chordChanges = ##f
  es2.*4:m6.9  es2.*4:m6.9
  \repeat unfold 2 { es2.*8:m6.9 b2.*4:9.11+ es2.*4:m6.9 bes2.*2:7 as2.*2:13  es2.*4:m6.9 }
  \repeat unfold 2 { es2.*8:m6.9 } r2.
}

harmoniesB = \chordmode {
  \set chordChanges = ##f
  es2.*4:m6.9  es2.*4:m6.9
  es2.*8:m6.9 b2.*4:9.11+ es2.*4:m6.9 bes2.*2:7 as2.*2:13  es2.*4:m6.9
  es2.*4:m6.9 r2.
}


theNotes =  \relative c'' {
  \clef "treble" \time 6/8 \key ges \major
  \showStartRepeatBar \bar "[|:" \mark \markup \box Intro
  \repeat volta 2 { R2.*4 } \break | % 5
  \once \override Score.RehearsalMark.break-visibility = #end-of-line-visible
  \mark \markup 3X
  R2.*2 | % 11
  r4. a8 _\markup Trumpet ( bes4 ) | % 12
  a8\trill ges r r es des \break
  \mark-y-dir #`( (,left . ,DOWN) (,right . ,UP) )
  \doubleMark
  \markup "Rhythm section cont. simile"
  \markup {  \with-color #red \raise #1 \musicglyph "scripts.varsegno" \box A }
  es4. ~ es4 ges8
  R2. | % 15
  r4. a8 bes4 | % 16
  a8\trill ges8 r r es des | % 17
  es2. ~ | % 18
  es2. | % 19
  r4. a8 bes4 |
  a8\trill ges8 r r es des | \break % 21
  es4. ~ es4 ges8 | % 22
  R2. | % 23
  r4. a8 bes4 | % 24
  a8\trill ges8 r r es des | % 25
  es2. ~ | % 26
  es2. | % 27
  r4. \acciaccatura a8 bes8 des a | % 28
  r4. r8 as ges | \break % 29
  as4. ~ as4 bes8 \bendAfter #-4 | R2. | % 31
  r4. a8 bes4 | % 32
  a8\trill ges8 r r es des |  % 33
  es2. ~ | % 34
  es2. | % 35
  R2. | % 36
  r8  es' ges as ges es8 \bar "||" \break
  \mark \markup { \box { B } }
  ges16 as r8 r r4. | % 38
  R2. | % 39
  r4. r8 es ges |
  as8 ges es ges es8 des |   % 41
  es8 r r r4. | % 42
  R2.*2 | % 44
  r8 es ges as ges es8 | \break % 45
  ges16 as r8 r r4. | % 46
  R2. | % 47
  r4. r8 es ges | % 48
  as8 ges es ges es8 des |  % 49
  es8 r r r4. |
  R2. | % 51
  r4. \acciaccatura a,8 bes8 des a | % 52
  r4. r8 as ges \bendAfter #-4  | \break % 53
  as4. ~ as4 bes8 | % 54
  R2. | % 55
  r4. a8 bes4 | % 56
  a8\trill ges8 r r es des |  % 57
  es2. ~ | % 58
  es2. | % 59
  r4. \startParenthesis \parenthesize a8 ( bes4 ) | % 12
  a8\trill ges r r es \endParenthesis \parenthesize des
  \break \bar "||-[|:"
  \doubleMark
  \markup \center-column { { \concat { "Solos on " \box A \with-color #red " then D.S. al Ending" } }
                           { \small "(Last solo ends w/ break and pickup)" } }
  \markup \box Ending
  \repeat volta 2 {
    es'2.~ | 2. | r4. r8 ges es des bes as ges es des |
    es2.~ | 2. | r4. r8 es ges as ges es ges es des \break
    es2.~ | 2. | r4. r8 es ges as ges es ges es des
    es2.~ | 2. |  }
  \alternative { { R2.*2 \break } { R2.} } R2.*4
  \bar ".."
  %\label #'theLastPage
}

theNotesII =  \relative c' {
  \clef "treble" \time 6/8 \key ges \major
  \repeat volta 2 { R2.*4 } | % 5
  R2.*2 | % 11
  r4. f8 _\markup Tenor ( ges4 ) | % 12
  f8\trill des8 r r bes as
  bes4.~ bes4 es8 | % 14
  R2. | % 15
  r4. f8 ges4 | % 16
  f8\trill des8 r r bes as | % 17
  bes2. ~ | % 18
  bes2. | % 19
  r4. f'8 ges4 |
  f8\trill des8 r r ces a | % 21
  ces4.~ 4 des8 | % 22
  R2. | % 23
  r4. f8 ges4 | % 24
  f8\trill des8 r r bes as | % 25
  bes2. ~ | % 26
  bes2. | % 27
  r4. \acciaccatura f'8 ges8 bes ges | % 28
  r4. r8 f es | % 29
  f4.~ f4 ges8 \bendAfter #-4 |
  R2. | % 31
  r4. f8 ges4 | % 32
  f8\trill des8 r r bes as |  % 33
  bes2. ~ | % 34
  bes2. | % 35
  R2. | % 36
  r8 a' des es des
  a8 \bar "||"
  des16 es r8 r r4. | % 38
  R2. | % 39
  r4. r8 bes des |
  es8 des bes es bes as8 | % 41
  bes8 r r r4. | % 42
  R2.*2 | % 44
  r8 a des es des a8 | % 45
  des16 es r8 r r4. | % 46
  R2. | % 47
  r4. r8 a, des | % 48
  es8 des bes es bes as!8 | % 49
  bes8 r r r4. |
  R2. | % 51
  r4.\acciaccatura f8 ges8 bes ges | % 52
  r4. r8 f es \bendAfter #-4  | % 53
  f4. f4 ges8 | % 54
  R2. | % 55
  r4. f8 ges4 | % 56
  f8\trill des8 r r bes as | % 57
  bes2. ~ | % 58
  bes2. | % 59
  r4. \startParenthesis \parenthesize  f'8 ( ges4 ) |
  f8\trill des8 r r bes \endParenthesis \parenthesize as
  \repeat volta 2 {
    bes'2.~ | 2. | r4. r8 des bes as ges es des bes as |
    \repeat unfold 2 { bes2.~ | 2. | r4. r8 bes des es des bes des bes as  }
    bes2.~ | 2. | }
  \alternative { { R2.*2 } { R2.} } R2.*4
  \bar ".."
}

chordsRhythm = \relative c' {
  \override Rest #'staff-position = #9
  \improvisationOn \override NoteHead.no-ledgers = ##t \time 6/8
  \repeat unfold 3 { r4. f8 8 r8 |  4. 4. }
}

chordsRhythmB = \relative c, {
  \override Rest #'staff-position = #-8
  \improvisationOn \override NoteHead.no-ledgers = ##t \time 6/8
  \repeat unfold 3 { r4. d8 8 r8 |  4. 4. }
}

Basse = \relative c {
  \clef "bass" \time 6/8 \key ges \major
  \showStartRepeatBar \bar "[|:" \mark \markup \box Intro
  \override TextSpanner.bound-details.left.text = "break"
  \override TextSpanner.after-line-breaking = #ly:spanner::kill-zero-spanned-time
  \repeat volta 2 {
    es4 bes'8 es es des8 | % 2
    es4 des8 es f des8 | % 3
    es,8 ges bes es es8 des | % 4
    es4 des8 es des bes8 }
  \break  \once \override Score.RehearsalMark.break-visibility = #end-of-line-visible
  \mark \markup 3X

  es,4 bes'8 es es des |
  es4 des8 es f des8 | % 11
  es,4 \oneVoice   \oneVoice \once \override TextSpanner #'extra-offset = #'( 0 . 1 ) r8 \startTextSpan r4. | % 12
  R2. \bar "||-[|:" \break
  \mark \markup {  \with-color #red \raise #1 \musicglyph "scripts.varsegno" \box A \box B }
  \repeat volta 2 {
    es4 \stopTextSpan  bes'8 es es des8 | % 14
    es4 des8 es f des8 | % 15
    es,8 ges bes es es8 des | % 16
    es4 des8 es des bes8 |  \break % 17
    es,4 bes'8 es es des8 | % 18
    es4 des8 es f des8 | % 19
    es,8 ges bes es es8 des |
    es4 des8 es des bes8 | \break % 21
    b,4 fis'8 b b a | % 22
    b4 a8 b cis fis, | % 23
    b,4 fis'8 b b a | % 22
    b4 a8 b cis bes,! | \break % 23
     es8 ges bes es es des8 | % 26
    es4 des8 es des bes8 | % 27
    es,4 bes'8 es es des8 | % 28
    es4 des8 es f des8 | \break % 29
    bes,4 f'8 bes bes as |
    bes4 as8 bes as f | % 31
    as,8 es' ges as as ges8 | % 32
    as4 ges8 as ges es | \break % 33
    es4 bes'8 es es des8 | % 34
    es4 des8 es f des8 | % 35
    es,8 ges bes es es8 des | % 36
    es4 des8 es des bes8 \break }
  \mark-y-dir #`( (,left . ,DOWN) (,right . ,UP) )
    \doubleMark
  \markup \center-column { { \concat { "Solos on " \box A \with-color #red " then D.S. al Ending" } }
                           { \small "(Last solo ends w/ break and pickup)" } }
  \markup \box Ending
  \repeat volta 8 {
    es,4 bes'8 es es des8 | % 18
    es4 des8 es f des8 | % 19
  }
  \alternative {
    { es,4 bes'8 es es des8 | es4 des8 es f des8 \break }
    { es,8 r4 \startTextSpan r4. | }
  }
  r4 \stopTextSpan des'8 es des bes | es, r4 \startTextSpan r4. | r4 \stopTextSpan des'8 es des bes | es, r4 r4.
  \break

  \bar ".."
}

BasseIntro = \relative c, {
  \clef "bass" \time 6/8 \key ges \major
  \showStartRepeatBar \bar "[|:"
  \override TextSpanner.bound-details.left.text = "break"
  \repeat volta 2 {
    es4 bes'8 es es des8 | % 2
    es4 des8 es f des8 | % 3
    es,8 ges bes es es8 des | % 4
    es4 des8 es des bes8 }
  es,4 bes'8 es es des8 | % 2
  es4 des8 es f des8 | % 3
  \oneVoice \once \override TextSpanner #'extra-offset = #'( 0 . 1 )
  es,8 \startTextSpan r4 r4. | R2. s2. \stopTextSpan s2. s2.*62
  \once \override Staff.Clef #'break-visibility = #'#(#t #t #t)
  es8 _\markup (pn/bs) r4 \startTextSpan r4. | r4 \stopTextSpan des'8 es des bes | es, r4 \startTextSpan r4. | r4 \stopTextSpan des'8 es des bes | es, r4 r4.
}

grille = \chordmode {
  \bar "[|:"
  \repeat unfold 2 { \repeat percent 4 { es1:m6.9 } \break }
  \repeat percent 4 { b1:9.11+ } \break
  \repeat percent 4 { es1:m6.9 } \break
  \repeat percent 2 { bes1:7 } \repeat percent 2 { as1:13 } \break
  \repeat percent 4 { es1:m6.9 } \break \bar ":|][|:"
  \mark \markup Ending
  \repeat percent 4 { es1:m6.9 }
  \mark \markup 4x \bar ":|]"
  \label #'theLastPage

}

grilleRhythm = {
  \improvisationOn
  \repeat unfold 2 { r4 c-^ r8 8 r4 | r4 c-^ r8 8 r4 }
  \repeat unfold 20 { \hideNotes c4 s2. }
}

\book {
  \paper {
    #(set-paper-size "a5landscape")
    %page-count = #1
    print-first-page-number = ##t
  }
  #(define output-suffix "CTab")
  %\header { meter = \markup \with-color #red \bold "partition sur 2 pages" }
  \bookpart {
    \score {
      <<
        \new ChordNames { \harmonies }
        \new StaffGroup <<
          \new Staff \with { instrumentName = \CleSol } { \theNotes \label #'theLastPage }

          \new Staff \theNotesII
          \new Staff \with { \RemoveEmptyStaves } << \chordsRhythm \\  \BasseIntro  >>
      >> >>
    } %\form
} }

\book {
  \paper {
    #(set-paper-size "a5landscape")
    print-first-page-number = ##t
  }
  #(define output-suffix "BbTab")
  \bookpart {
    \score {
      <<
        \new ChordNames { \transpose c d \harmonies }
        \new StaffGroup <<
          \new Staff \with { instrumentName = \Bb } { \transpose c d \theNotes \label #'theLastPage }
          \new Staff \transpose c d \theNotesII
          \new Staff \with { \RemoveEmptyStaves } << \chordsRhythm \\  \BasseIntro  >>
      >> >>
    } %\form
} }

\book {
  \paper {
    #(set-paper-size "a5landscape")
    print-first-page-number = ##t
  }
  #(define output-suffix "EbTab")
  \bookpart {
    \score {
      <<
        \new ChordNames { \transpose c a \harmonies }
        \new StaffGroup <<
          \new Staff \with { instrumentName = \Eb } { \transpose c a \theNotes \label #'theLastPage }
          \new Staff \transpose c a \theNotesII
          \new Staff \with { \RemoveEmptyStaves } << \chordsRhythm \\  \BasseIntro  >>
      >> >>
    } %\form
} }

\book {
  \paper {
    #(set-paper-size "a4")
    print-first-page-number = ##t
  }
  #(define output-suffix "Ca4")
  \bookpart {
    \score {
      <<
        \new ChordNames { \harmonies }
        \new StaffGroup <<
          \new Staff \with { instrumentName = \CleSol } \theNotes
          \new Staff \theNotesII
          \new Staff \with { \RemoveEmptyStaves } << \chordsRhythm \\  \BasseIntro  >>
      >> >>
    }
  }  \bookpart {
    \score {
      \gridLayout
      \new ChordGrid \grille
} } }

\book {
  \paper {
    #(set-paper-size "a4")
    print-first-page-number = ##t
  }
  #(define output-suffix "Bba4")
  \bookpart {
    \score {
      <<
        \new ChordNames { \transpose c d \harmonies }
        \new StaffGroup <<
          \new Staff \with { instrumentName = \Bb } \transpose c d \theNotes
          \new Staff \transpose c d \theNotesII
          \new Staff \with { \RemoveEmptyStaves } << \chordsRhythm \\  \BasseIntro  >>
      >> >>
    }
  }  \bookpart {
    \score {
      \gridLayout
      \new ChordGrid \transpose c d \grille
} } }

\book {
  \paper {
    #(set-paper-size "a4")
    print-first-page-number = ##t
  }
  #(define output-suffix "Eba4")
  \bookpart {
    \score {
      <<
        \new ChordNames { \transpose c a \harmonies }
        \new StaffGroup <<
          \new Staff \with { instrumentName = \Eb } { \transpose c a \theNotes \label #'theLastPage }
          \new Staff \transpose c a \theNotesII
          \new Staff \with { \RemoveEmptyStaves } << \chordsRhythm \\  \BasseIntro  >>
      >> >>
    }
  }  \bookpart {
    \score {
      \gridLayout
      \new ChordGrid \transpose c a \grille
} } }

\book {
  \paper {
    #(set-paper-size "a5landscape")
    print-first-page-number = ##t
  }
  #(define output-suffix "BassTab")
  \bookpart {
    \score {
      <<
        \new ChordNames { \harmoniesB }
        \new Staff \with { instrumentName = \CleFa }   { <<  \Basse \\ \chordsRhythmB >>  \label #'theLastPage }
      >>
} } }

\book {
  \paper {
    #(set-paper-size "a4")
    print-first-page-number = ##t
  }
  #(define output-suffix "Bassa4")
  \bookpart {
    \score {
      <<
        \new ChordNames { \harmoniesB }
        \new Staff \with { instrumentName = \CleFa } <<  \Basse \\ \chordsRhythmB >>
      >>
    }
  } \bookpart {
    \score {
      \gridLayout
      \new ChordGrid \grille
} } }